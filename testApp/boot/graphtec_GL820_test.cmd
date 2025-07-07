#!../bin/linux-x86_64/graphtec_GL820_test

< envPaths

# Settings
epicsEnvSet("BOOT_DIR", ${PWD})
epicsEnvSet("STREAM_PROTOCOL_PATH", "$(TOP)/db")
epicsEnvSet("DEVICE_HOSTNAME", "graphtec-gl820.local:8023")
epicsEnvSet("BUS", "L0")

epicsEnvSet("P",     "gl820:")
epicsEnvSet("SCAN",  "1 second")
epicsEnvSet("MVBUS", "apd")

# Register all support components
cd "$(TOP)/dbd"
dbLoadDatabase("dbd/graphtec_GL820.dbd")
graphtec_GL820_test_registerRecordDeviceDriver(pdbbase)

# Set up IOC/hardware links - TCP port
#     (link, host, priority, noAutoConnect, noEosProcessing)
drvAsynIPPortConfigure($(BUS), "$(DEVICE_HOSTNAME)", 0, 0, 0)
drvGL820Configure($(MVBUS), $(BUS))
epicsThreadSleep(2)

# Only for debugging
asynSetTraceIOMask("$(BUS)", 0, 7)
asynSetTraceMask("$(BUS)", 0, 9)

# Load record instances
cd "$(TOP)/db"
dbLoadRecords("graphtec_GL820.db", "P=$(P),S=$(SCAN),PORT=$(MVBUS),ADDR=0,TMO=5")

# Start the IOC control loop
cd $(BOOT_DIR)
iocInit()

# Start any sequence programs
dbpf $(P):START 1
