LOCAL_PATH := $(call my-dir)


#
# Statically Linked
#

include $(CLEAR_VARS)
LOCAL_MODULE            := sqlite3-a
LOCAL_MODULE_FILENAME   := libsqlite3
LOCAL_SRC_FILES         := ../build/sqlite3.c
LOCAL_C_INCLUDES        := ../build
LOCAL_EXPORT_C_INCLUDES := ../build
LOCAL_CFLAGS            := -DSQLITE_THREADSAFE=1
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE            := sqlite3-static-cli
LOCAL_MODULE_FILENAME   := sqlite3-static
LOCAL_STATIC_LIBRARIES  := libsqlite3-a
LOCAL_SRC_FILES         := ../build/shell.c ../build/sqlite3.c
LOCAL_C_INCLUDES        := ../build
LOCAL_EXPORT_C_INCLUDES := ../build
LOCAL_CFLAGS            := -DSQLITE_THREADSAFE=1 -fPIE
LOCAL_LDFLAGS           := -fPIE -pie
include $(BUILD_EXECUTABLE)


#
# Dynamically Linked
#

include $(CLEAR_VARS)
LOCAL_MODULE            := sqlite3-so
LOCAL_MODULE_FILENAME   := libsqlite3
LOCAL_SRC_FILES         := ../build/sqlite3.c
LOCAL_C_INCLUDES        := ../build
LOCAL_EXPORT_C_INCLUDES := ../build
LOCAL_CFLAGS            := -DSQLITE_THREADSAFE=1
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE            := sqlite3-dynamic-cli
LOCAL_MODULE_FILENAME   := sqlite3-dynamic
LOCAL_SHARED_LIBRARIES  := libsqlite3-so
LOCAL_SRC_FILES         := ../build/shell.c ../build/sqlite3.c
LOCAL_C_INCLUDES        := ../build
LOCAL_EXPORT_C_INCLUDES := ../build
LOCAL_CFLAGS            := -DSQLITE_THREADSAFE=1 -fPIE
LOCAL_LDFLAGS           := -fPIE -pie
include $(BUILD_EXECUTABLE)
