when FLOW_INIT {
    set ilx_handle [ILX::init "arista_directflow_create" "arista_directflow_create"]
    if { [IP::protocol] == 6 } {
        # TCP Handler
        #log local0.notify "TCP:SRCADDR_[IP::remote_addr]:SRCPORT_[TCP::remote_port]:DSTADDR_[IP::local_addr]:DSTPORT_[TCP::local_port]:FLOWEXPRY_[IP::idle_timeout]"
        set ip_protocol "tcp"
        set source_addr [IP::remote_addr]
        set source_port [TCP::remote_port]
        set dest_addr [IP::local_addr]
        set dest_port [TCP::local_port]
        if { [catch { set res [ILX::call $ilx_handle "createDirectflowEntry" "send log level debugging message IPPROTO:$ip_protocol SRC_ADDR:$source_addr SRC_PORT:$source_port DST_ADDR:$dest_addr DST_PORT:$dest_port" ]} result]} {
            log local0.error "ILX Failure: $result"
            return
        }
    }
    elseif { [IP::protocol] == 17 } {
        # UDP Handler
        #log local0.notify "UDP:SRCADDR_[IP::remote_addr]:SRCPORT_[UDP::remote_port]:DSTADDR_[IP::local_addr]:DSTPORT_[UDP::local_port]:FLOWEXPRY_[IP::idle_timeout]" 
        set ip_protocol "udp"
        set source_addr [IP::remote_addr]
        set source_port [UDP::remote_port]
        set dest_addr [IP::local_addr]
        set dest_port [UDP::local_port]
        if { [catch { set res [ILX::call $ilx_handle "createDirectflowEntry" "send log level debugging message IPPROTO:$ip_protocol SRC_ADDR:$source_addr SRC_PORT:$source_port DST_ADDR:$dest_addr DST_PORT:$dest_port" ]} result]} {
            log local0.error "ILX Failure: $result"
            return
        }        
    }
    else {
        log local0. "Ignoring unmatched IP protocol [IP::protocol] from [IP::remote_addr] to [IP::local_addr]"
    }
}
