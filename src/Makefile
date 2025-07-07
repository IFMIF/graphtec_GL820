TOP = ..
include $(TOP)/configure/CONFIG

#==============================================================================
# DB/DBD files
#==============================================================================

# <name>.dbd will be generated from <name>Include.dbd
DBD += graphtec_GL820.dbd

# Install databases, templates & substitutions like this
DB += graphtec_GL820.db

#==============================================================================
# Source and libraries
#==============================================================================

# Build GL820 as a library for an IOC
LIBRARY_IOC = graphtec_GL820

# Library source files
graphtec_GL820_SRCS += drvGL820.cpp drvGL820_Cmnd.cpp

# Link with the asyn and base libraries
graphtec_GL820_LIBS += asyn
graphtec_GL820_LIBS += $(EPICS_BASE_IOC_LIBS)

#==============================================================================
# EPICS build rules
#==============================================================================

include $(TOP)/configure/RULES
# ADD EXTRA GNUMAKE RULES BELOW HERE
