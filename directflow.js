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
exports.createDirectflowEntry = function(command, callback) {
    var options = {
        port: 5080,
        host: '192.168.1.102',
        path: '/command-api',
        strict: true,
        user: "admin",
        pass: "admin"
    };
    var client = new rpc.Client(options);
    client.call(
        {
            "jsonrpc":"2.0",
            "method":"runCmds",
            "params":{
                "format":"json",
                "timestamps":false,
                "autoComplete":false,
                "expandAliases":false,
                "cmds":[
                    {
                        "cmd":"enable",
                        "input":"api"
                    },
                    command
                    ],
                    "version":1
            },
            "id":"EapiExplorer-1"},
        function(err, res) {
            callback(err)
        }
    );
};
