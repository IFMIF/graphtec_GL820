TOP = ../..
include $(TOP)/configure/CONFIG

#==============================================================================
# DB/DBD files
#==============================================================================

# Create the application DBD file from the library DBD file
DBD += graphtec_GL820_test.dbd
graphtec_GL820_test_DBD += graphtec_GL820.dbd

#==============================================================================
# Source and libraries
#==============================================================================

# Build an IOC application
PROD_IOC = graphtec_GL820_test

# Application source files
# <name>_registerRecordDeviceDriver.cpp will be created from <name>.dbd
graphtec_GL820_test_SRCS += graphtec_GL820_test_registerRecordDeviceDriver.cpp
graphtec_GL820_test_SRCS_DEFAULT += main.cpp

# Add a definition for each support application used by this application
# N1470App_LIBS += N1470 calc stream asyn pcre seq pv sscan
graphtec_GL820_test_LIBS += graphtec_GL820
graphtec_GL820_test_LIBS += asyn
graphtec_GL820_test_LIBS += $(EPICS_BASE_IOC_LIBS)

#==============================================================================
# EPICS build rules
#==============================================================================

include $(TOP)/configure/RULES
#  ADD EXTRA GNUMAKE RULES BELOW HERE
USR_CXXFLAGS += -Wno-deprecated -Werror -fPIC
