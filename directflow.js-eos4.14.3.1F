/*
* create a directflow entry on Arista EOS
*
*/

var rpc = require('node-json-rpc2');
var exports = module.exports = {};

/**
 * create directflow entry
 * 
 * @param {String} command
 * @return {Object} data
 */
exports.createDirectflowEntry = function(flow_id, source_vlan, ip_protocol, source_address, destination_address, destination_port, callback) {
    var options = {
        port: 80,
        host: '10.251.114.36',
        path: '/command-api',
        strict: true,
        user: "f5test",
        pass: "f5test"
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
                    "match ip protocol " + ip_protocol,
                    "match source ip " + source_address,
                    "match destination ip " +  destination_address,
                    "match destination port " + destination_port,
                    "action set vlan 4093",
                    "action set destination mac 00:1c:73:2a:5f:10",
                    "action output interface et5",
                    "flow " + flow_id + "-inverse",
                    "timeout idle 15",
                    "match ip protocol " + ip_protocol,
                    "match source ip " + destination_address,
                    "match destination ip " + source_address,
                    "match source port " + destination_port,
                    "action set vlan " + source_vlan,
                    "action set destination mac 00:1c:73:2a:5f:10",
                    "action output interface et6",
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
