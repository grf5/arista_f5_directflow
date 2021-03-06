/*
* create a directflow entry on Arista EOS for ipv6
*
*/

var rpc = require('node-json-rpc2');
var exports = module.exports = {};

/**
 * create directflow entry for ipv6
 * 
 * @param {String} command
 * @return {Object} data
 */
exports.createDirectflowEntryv6 = function(flow_id, source_vlan, ip_protocol, source_address, destination_address, destination_port, callback) {
    var options = {
        port: 80,
        host: '192.168.1.10',
        path: '/command-api',
        strict: true,
        user: "f5test",
        pass: "mypassword"
    };
    var client = new rpc.Client(options);
    client.call(
        {
            "jsonrpc":"2.0",
            "method":"runCmds",
            "params":{
                "format":"json",
                "timestamps":false,
                "cmds":["enable",
                    "configure terminal",
                    "directflow",
                    "flow " + flow_id,
                    "timeout idle 15",
                    "no persistent",
                    "match ethertype 34525",
                    "match ip protocol " + ip_protocol,
                    "match source ipv6 " + source_address,
                    "match destination ipv6 " +  destination_address,
                    "match destination port " + destination_port,
                    "action set destination mac 1a:2b:3c:4d:5e:6f",
                    "action set vlan 1016",
                    "action output interface Ethernet 5",
                    "flow " + flow_id + "-inverse",
                    "timeout idle 15",
                    "no persistent",
                    "match ethertype 34525",
                    "match ip protocol " + ip_protocol,
                    "match source ipv6 " + destination_address,
                    "match destination ipv6 " + source_address,
                    "match source port " + destination_port,
                    "action set destination mac aa:bb:cc:11:22:33",
                    "action set vlan 1017",
                    "action output interface Ethernet 6",
                    "end"
                    ],
            "version":1
            },
            "id":"EapiExplorer-1"},
        function(err, res) {
            callback(err)
        }
    );
};
