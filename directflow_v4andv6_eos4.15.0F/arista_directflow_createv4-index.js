/*
 * iRulesLX RPC for Arista Directflow entry creation
 *
 */

/* Import the f5-nodejs module. */
var f5 = require('f5-nodejs');
var directflow = require('./directflow.js');

/* Create a new rpc server for listening to TCL iRule calls. */
var ilx = new f5.ILXServer();
ilx.listen();

/**
  * create directflow entry on Arista EOS device
  *
  * @param {String} protocol
  * @param {String} source_address
  * @return {Boolean} result
  */
ilx.addMethod('createDirectflowEntry', function(req, res) {
	directflow.createDirectflowEntry(req.params()[0], req.params()[1], req.params()[2], req.params()[3], req.params()[4], req.params()[5], function(result) {
		if(typeof result !== undefined) {
			res.reply(true);
		} else {
			res.reply(false);
		}
	});
});
