INCLUDE_DIRECTORIES( ../devcom )
INCLUDE_DIRECTORIES( ../amac )

LINK_DIRECTORIES( ${CMAKE_BINARY_DIR}/lib )

# add executables, but exclude files ending in "~"
FILE(GLOB tools [a-zA-Z]*.c[a-zA-Z]*)
LIST(FILTER tools EXCLUDE REGEX ".*~$")

FOREACH(target ${tools})
  GET_FILENAME_COMPONENT(execname ${target} NAME_WE)
  GET_FILENAME_COMPONENT(srcfile ${target} NAME)

  ADD_EXECUTABLE(${execname} ${srcfile})
  TARGET_LINK_LIBRARIES(${execname} -ldevcom)
  ADD_DEPENDENCIES(${execname} devcom)

  TARGET_LINK_LIBRARIES(${execname} -lamac)
  ADD_DEPENDENCIES(${execname} amac)

  INSTALL(TARGETS ${execname} RUNTIME DESTINATION bin)
ENDFOREACH()
