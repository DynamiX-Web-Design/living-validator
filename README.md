#LivingValidator gem

This gem is designed to integrate with the http://validator.nu service. It will work with the public instance or a private instance. The source for the validator is available here: [BitBucket Repo](https://bitbucket.org/validator/build/src). 

The functionality here is pretty basic. You may query the validator, receive a response, and go through the messages it gives you. There are convenience methods for getting only the error messages, getting the total number of error messages, or getting the total number of messages.

#Options

**endpoint**: defaults to validator.nu, but can be overridden to use a private instance. e.g. `localhost:8888`

**lax_type**: defaults to false, but can be overridden to allow lax content type checking

#Examples

##Public Instance

    result = LivingValidator::Validator.check 'http://github.com'
	puts "There were #{result.errorCount} errors found!"
	if result.errorCount > 0
		puts "Tisk Tisk, Github"
	end

##Private Instance

	result = LivingValidator::Validator.check 'http://github.com', {:endpoint => 'localhost:8888'}
	puts "There were #{result.errorCount} errors found!"
	if result.errorCount > 0
		puts "Tisk Tisk, Github"
	end

##Lax Content-Type Checking

	result = LivingValidator::Validator.check 'http://github.com', {:lax_type => true}
	puts "There were #{result.errorCount} errors found!"
	if result.errorCount > 0
		puts "Tisk Tisk, Github"
	end

# License / Copyright

Copyright (c) 2012 DyanmiX Web Design, LLC (http://dynamixwebdesign.com)

Licensed under the Creative Commons Attribution-ShareAlike 3.0 Unported. More info in the LICENSE file.
