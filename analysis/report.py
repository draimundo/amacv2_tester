import datetime
import pandas as pd
import matplotlib.pyplot as plt
import matplotlib
import glob, re
import os.path

from IPython.display import HTML, display

class Reports:
    def __init__(self,reports):
        self.names   =[r.name for r in reports]

        self.genparam=pd.concat([r.genparam for r in reports], ignore_index=True) if len(reports)>0 else None
        self.i2c     =pd.concat([r.i2c      for r in reports], ignore_index=True) if len(reports)>0 else None
        self.bgo     =pd.concat([r.bgo      for r in reports], ignore_index=True) if len(reports)>0 else None
        self.noise   =pd.concat([r.noise    for r in reports], ignore_index=True) if len(reports)>0 else None
        self.calib   =pd.concat([r.calib    for r in reports], ignore_index=True) if len(reports)>0 else None
        self.icalib  =pd.concat([r.icalib   for r in reports], ignore_index=True) if len(reports)>0 else None
        self.clk     =pd.concat([r.clk      for r in reports], ignore_index=True) if len(reports)>0 else None
        self.error   =pd.concat([r.error    for r in reports], ignore_index=True) if len(reports)>0 else None

    def append(self,r):
        self.names.append(r.name)

        self.genparam=pd.concat([r.genparam, self.genparam], ignore_index=True) if self.genparam is not None else r.genparam
        self.i2c     =pd.concat([r.i2c     , self.i2c     ], ignore_index=True) if self.i2c      is not None else r.i2c
        self.bgo     =pd.concat([r.bgo     , self.bgo     ], ignore_index=True) if self.bgo      is not None else r.bgo
        self.noise   =pd.concat([r.noise   , self.noise   ], ignore_index=True) if self.noise    is not None else r.noise
        self.calib   =pd.concat([r.calib   , self.calib   ], ignore_index=True) if self.calib    is not None else r.calib
        self.icalib  =pd.concat([r.icalib  , self.icalib  ], ignore_index=True) if self.icalib   is not None else r.icalib
        self.clk     =pd.concat([r.clk     , self.clk     ], ignore_index=True) if self.clk      is not None else r.clk
        self.error   =pd.concat([r.error   , self.error   ], ignore_index=True) if self.error    is not None else r.error


class Report:
    def __init__(self,name):
        self.name=name
        self.power=None
        self.bg=None

        self.bestVDDBG=None
        self.bestVDD=None

        self.load_power()
        self.load_bg()
        self.load_calib()

    def load_power(self):
        datapath='data/{AMAC}_Power.csv'.format(AMAC=self.name)

        data=pd.DataFrame()
        if os.path.exists(datapath):
            data=pd.read_csv(datapath,sep='\t')
            data['AMAC']=self.name
        self.power=data

    def load_i2c(self):
        datapath='log/{AMAC}_I2C_main.log'.format(AMAC=self.name)
        data=pd.DataFrame()
        if os.path.exists(datapath):
            data=pd.read_csv(datapath,sep=' ')
            data['AMAC']=self.name
        self.i2c=data

    def load_bg(self):
        datapath='data/{AMAC}_BANDGAP.csv'.format(AMAC=self.name)

        data=pd.DataFrame()
        if os.path.exists(datapath):
            data=pd.read_csv(datapath,sep='\t')
            data['AMAC']=self.name

            self.bestVDDBG=data.VDDBG[(data[data.AMBG==0].VDD-1.2).abs().argsort()].iloc[0]
            self.bestVDD  =data.VDD  [(data[data.AMBG==0].VDD-1.2).abs().argsort()].iloc[0]

        self.bg=data

    def load_calib(self):
        re_logname=re.compile('data/{AMAC}_VADC_(.*).csv'.format(AMAC=self.name))

        data=pd.DataFrame(columns=['AMAC','Channel','AMBG','RampGain','InputVoltage','ADCvalue'])
        for log in glob.glob('data/{AMAC}_VADC_*.csv'.format(AMAC=self.name)):
            a=pd.read_csv(log,sep='\t')
            match=re_logname.match(log)
            a['AMAC']=self.name
            a['Channel']=match.group(1)
            data=data.append(a)

        self.calib=data

    def load_icalib(self):
        re_logname=re.compile('log/{AMAC}_calib_ADC_I_(.*).log'.format(AMAC=self.name))

        resvalues=[0,100,10e3,1e6]

        data=pd.DataFrame(columns=['AMAC','Channel','InputCurrent','BandgapControl','RampGain','OpAmpGain','ResistorIdx','ADCvalue'])
        for log in glob.glob('log/{AMAC}_calib_ADC_I_*.log'.format(AMAC=self.name)):
            a=pd.read_csv(log,sep=' ')
            match=re_logname.match(log)
            a['AMAC']=self.name
            a['Channel']=match.group(1)
            a['ResistorValue']=a.ResistorIdx.map(lambda x: resvalues[x])
            data=data.append(a)

        self.icalib=data

    def load_clk(self):
        datapath='log/{AMAC}_CLK_main.log'.format(AMAC=self.name)
        row=[self.name,0,0,0,0,0,0,0,0,0,0]
        if os.path.exists(datapath):
            fh=open(datapath)
            data={}
            for line in fh:
                line=line.strip()
                if line=='': continue
                parts=line.split()
                data[parts[0]]=(int(parts[1]),int(parts[2]))
            fh.close()

            row=[self.name,
                 data['Internal_Oscillator:'][0],data['Internal_Oscillator:'][1],
                 data['External_Oscillator_10M_HVenabled_div0_HVCTRL:'][0],data['External_Oscillator_10M_HVenabled_div0_HVCTRL:'][1],
                 data['External_Oscillator_10M_HVenabled_div1_HVCTRL:'][0],data['External_Oscillator_10M_HVenabled_div1_HVCTRL:'][1],
                 data['External_Oscillator_10M_HVenabled_div2_HVCTRL:'][0],data['External_Oscillator_10M_HVenabled_div2_HVCTRL:'][1],
                 data['External_Oscillator_10M_HVenabled_div3_HVCTRL:'][0],data['External_Oscillator_10M_HVenabled_div3_HVCTRL:'][1]
                 ]

        self.clk=pd.DataFrame([row], columns=['AMAC','Internal_Freq','Internal_DC',
                                              'External_Div0_Freq','External_Div0_DC',
                                              'External_Div1_Freq','External_Div1_DC',
                                              'External_Div2_Freq','External_Div2_DC',
                                              'External_Div3_Freq','External_Div3_DC'])

    def load_error(self):
        datapath='log/{AMAC}_Errors.log'.format(AMAC=self.name)
        if os.path.exists(datapath):
            a=pd.read_csv(datapath, header=None, names=['raw']) #,sep=' ')
            a['AMAC']=self.name
            a['code']=a.apply(lambda row: int(row['raw'].split()[-1]),axis=1)
            a['date']=a.apply(lambda row: datetime.datetime.strptime(' '.join(row['raw'].split()[:5]),'%a %b %d %H:%M:%S %Y'),axis=1)
            self.error=a
        else:
            self.error=pd.DataFrame()

    def _render_power_row_html(self,title,param,power):
        value=power[param].iloc[0]

        return '<tr><td>{}</td><td>{}</td></tr>'.format(title,value)

    def render_power(self):
        vios=[]
        header=''.join(['<th>{}</th>'.format(title) for title in ['Field','Value']])
        rows=''.join([self._render_power_row_html('VDDLR [V]','AM_VDDLR',self.power),
                      self._render_power_row_html('VDDLR Current [A]','AM_VDDLR_Curr',self.power),
                      self._render_power_row_html('VDD [V]','AM_VDD',self.power),])
        html='<html><body><table><tr>%s</tr>%s</table></body></html>'%(header,rows)

        display(HTML(html))

    def render_i2c(self):
        plt.plot(self.i2c.VCC_H,self.i2c.I2C_SuccessRate)
        plt.xlabel('VCC_H [V]')
        plt.ylabel('I2C Success Rate')

    def render_bg(self):
        print('Set VDDBG to {} for VDD={}V'.format(self.bestVDDBG,self.bestVDD))

        subdata=self.bg[self.bg.VDDBG==13]
        plt.plot(subdata.AMBG,subdata.AM600BG,label='AM600BG')
        plt.plot(subdata.AMBG,subdata.AM900BG,label='AM900BG')
        plt.plot(subdata.AMBG,subdata.VDD    ,label='VDD')
        plt.legend(frameon=False)
        plt.xlim(0,15)
        plt.ylim(0,1.5)
        plt.xlabel('AM Bandgap Setting')
        plt.ylabel('Value [V]')
        plt.title('{} - VDDBG={}'.format('AMACREF3',13))
        plt.show()

        subdata=self.bg[self.bg.AMBG==0]
        plt.plot(subdata.VDDBG,subdata.AM600BG,label='AM600BG')
        plt.plot(subdata.VDDBG,subdata.AM900BG,label='AM900BG')
        plt.plot(subdata.VDDBG,subdata.VDD    ,label='VDD')
        plt.legend(frameon=False)
        plt.xlim(0,15)
        plt.ylim(0,1.5)
        plt.xlabel('AM Bandgap Setting')
        plt.ylabel('Value [V]')
        plt.title('{} - AMBG={}'.format('AMACREF3',0))
        plt.show()

    def render_calib_ambg(self,RampGain=0):
        data=self.calib[(self.calib.AMAC==self.name)&(self.calib.RampGain==RampGain)]
        for chkey,chgroup in data.groupby('Channel'):
            for bgkey,bggroup in chgroup.groupby('AMBG'):
                plt.plot(bggroup.InputVoltage,bggroup.ADCvalue,label='%d'%bgkey)
            plt.xlabel('Input Voltage [V]')
            plt.ylabel('ADC Count')
            plt.ylim((0,1024))
            plt.xlim((0,1.0))
            plt.legend(title='AMBG',frameon=False,ncol=4)
            plt.title('%s - RampGain=%d'%(chkey,RampGain))
            plt.show()

    def render_calib_rampgain(self,AMBG=0):
        data=self.calib[(self.calib.AMAC==self.name)&(self.calib.AMBG==AMBG)]
        for chkey,chgroup in data.groupby('Channel'):
            for rgkey,rggroup in chgroup.groupby('RampGain'):
                plt.plot(rggroup.InputVoltage,rggroup.ADCvalue,label='%d'%rgkey)
            plt.xlabel('Input Voltage [V]')
            plt.ylabel('ADC Count')
            plt.ylim((0,1024))
            plt.xlim((0,1.0))
            plt.legend(title='RampGain',frameon=False,ncol=2)
            plt.title('%s - AMBG=%d'%(chkey,AMBG))
            plt.show()

    def render_icalib(self,BandgapControl=10,RampGain=3):
        data=self.icalib[(self.icalib.AMAC==self.name)&(self.icalib.BandgapControl==BandgapControl)&(self.icalib.RampGain==RampGain)]
        data=data.sort_values('InputCurrent')
        for chkey,chgroup in data.groupby('Channel'):
            for oakey,oagroup in chgroup.groupby('OpAmpGain'):
                for rikey,rigroup in oagroup.groupby('ResistorIdx'):
                    plt.semilogx(rigroup.InputCurrent*1e3,rigroup.ADCvalue,color=matplotlib.cm.tab20(oakey/20),label='%d'%oakey)
            plt.xlabel('Input Current [mA]')
            plt.ylabel('ADC Count')
            plt.ylim((0,1024))
            plt.xlim((0,1e2))
            handles, labels = plt.gca().get_legend_handles_labels()
            i =1
            while i<len(labels):
                if labels[i] in labels[:i]:
                    del(labels[i])
                    del(handles[i])
                else:
                    i+=1
            plt.legend(handles,labels,title='OpAmpGain',frameon=False,ncol=2)
            plt.title('%s, BandgapControl=%d, RampGain=%d'%(chkey,BandgapControl,RampGain))
            plt.show()

    def _render_clk_row_html(self,name,title,freqlim):
        freq=self.clk.iloc[0]['%s_Freq'%name]
        freq='%d'%freq
        dc=self.clk.iloc[0]['%s_DC'%name]
        dc='%d'%dc
        return '<tr><td>%s</td><td>%s</td><td>%s</td></tr>'%(title,freq,dc)

    def render_clk(self):
        header='<th></th><th>Frequency (Hz)</th><th>Duty Cycle (%)</th>'
        rows=''.join([self._render_clk_row_html('Internal','Internal',(30,50))])
        html='<html><body><table><tr>%s</tr>%s</table></body></html>'%(header,rows)
        display(HTML(html))
