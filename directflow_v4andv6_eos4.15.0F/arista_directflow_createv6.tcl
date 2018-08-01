when FLOW_INIT {
    set ilx_handle [ILX::init "arista_directflow_createv6" "arista_directflow_createv6"]
    if { [IP::protocol] == 6 } {
        # TCP Handler
        set flow_id [expr { int(100000000000 * rand()) }]
        log local0. "TCP($flow_id):VLAN_[LINK::vlan_id]:SRCADDR_[IP::remote_addr]:SRCPORT_[TCP::remote_port]:DSTADDR_[IP::local_addr]:DSTPORT_[TCP::local_port]"
        set ip_protocol "tcp"
        set source_addr [IP::remote_addr]
        set dest_addr [IP::local_addr]
        set dest_port [TCP::local_port]
        if { [catch { set res [ILX::call $ilx_handle "createDirectflowEntryv6" "$flow_id" "[LINK::vlan_id]" "$ip_protocol" "$source_addr" "$dest_addr" "$dest_port" ]} result]} {
            log local0.error "ILX Failure: $result"
            return
        }
    }
    elseif { [IP::protocol] == 17 } {
        # UDP Handler
        set flow_id [expr { int(100000000000 * rand()) }]
        log local0. "UDP($flow_id):VLAN_[LINK::vlan_id]:SRCADDR_[IP::remote_addr]:SRCPORT_[UDP::remote_port]:DSTADDR_[IP::local_addr]:DSTPORT_[UDP::local_port]" 
        set ip_protocol "udp"
        set source_addr [IP::remote_addr]
        set dest_addr [IP::local_addr]
        set dest_port [UDP::local_port]
        if { [catch { set res [ILX::call $ilx_handle "createDirectflowEntryv6" "$flow_id" "[LINK::vlan_id]" "$ip_protocol" "$source_addr" "$dest_addr" "$dest_port" ]} result]} {
            log local0.error "ILX Failure: $result"
            return
        }        
    }
    else {
        # Other protocols
        log local0. "Ignoring unmatched IP protocol [IP::protocol] from [IP::remote_addr] to [IP::local_addr]"
    }
}
