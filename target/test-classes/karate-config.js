 function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    myVarName: 'someValue',
	username: 'admin',
	password: 'welcome',
	_url: 'http://localhost:9897'
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
	config.username = 'author';
	config.password = 'userpassword'
    // customize
  }
  else if (env == 'build') {
  	config.username = 'author';
  	config.password = 'userpassword'
      // customize
    }
  return config;
}