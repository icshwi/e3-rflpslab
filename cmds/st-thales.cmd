#

require s7plc,1.4.0p


epicsEnvSet("TOP", "$(E3_CMD_TOP)/..")


epicsEnvSet("PREFIX", "$(RFLPS_PREFIX=BENCH:RFS01)")
epicsEnvSet("PLCIP", "$(RFLPS_IP=172.30.4.221)")

#var s7plcDebug 1

## Datablocks
#epicsEnvSet("TCPPORTCPU", "3000")
#epicsEnvSet("PLCPORTCPU", "PLCCPU")
#epicsEnvSet("INSIZECPU", "8")
#epicsEnvSet("OUTSIZECPU", "4")

#epicsEnvSet("TCPPORTAF", "3001")
#epicsEnvSet("PLCPORTAF", "PLCAF")
#epicsEnvSet("INSIZEAF", "836")
#epicsEnvSet("OUTSIZEAF", "494")

#epicsEnvSet("TCPPORTDIO", "3002")
#epicsEnvSet("PLCPORTDIO", "PLCDIO")
#epicsEnvSet("INSIZEDIO", "408")
#epicsEnvSet("OUTSIZEDIO", "68")

epicsEnvSet("TCPPORTPSU", "3003")
epicsEnvSet("PLCPORTPSU", "PLCPSU")
epicsEnvSet("INSIZEPSU", "28")
epicsEnvSet("OUTSIZEPSU", "20")

#s7plcConfigure("$(PLCPORTCPU)","$(PLCIP)",$(TCPPORTCPU),$(INSIZECPU),$(OUTSIZECPU),1,2500,500)
#s7plcConfigure("$(PLCPORTAF)","$(PLCIP)",$(TCPPORTAF),$(INSIZEAF),$(OUTSIZEAF),1,2500,500)
#s7plcConfigure("$(PLCPORTDIO)","$(PLCIP)",$(TCPPORTDIO),$(INSIZEDIO),$(OUTSIZEDIO),1,2500,500)
s7plcConfigure("$(PLCPORTPSU)","$(PLCIP)",$(TCPPORTPSU),$(INSIZEPSU),$(OUTSIZEPSU),1,2500,500)

epicsEnvSet("EPICS_DB_INCLUDE_PATH", "$(TOP)/rflpslab-loc/rflpslabApp/Db/")

#dbLoadTemplate("$(TOP)/template/rflpsCPU.substitutions", "PREFIX=$(PREFIX)")
#dbLoadTemplate("$(TOP)/template/rflpsAF.substitutions", "PREFIX=$(PREFIX)")
#dbLoadTemplate("$(TOP)/template/rflpsDIO.substitutions", "PREFIX=$(PREFIX)")
dbLoadTemplate("$(TOP)/template/rflpsPSU.substitutions", "PREFIX=$(PREFIX)")

# After installation.

# dbLoadRecords("rflpsCPU.db", "PREFIX=$(PREFIX)")
# dbLoadRecords("rlpsAF.db", "PREFIX=$(PREFIX)")
# dbLoadRecords("rflpsDIO", "PREFIX=$(PREFIX)")
# dbLoadRecords("rflpsPSU", "PREFIX=$(PREFIX)")



iocInit


dbl > "$(TOP)/$(PREFIX)_PVs.list"

