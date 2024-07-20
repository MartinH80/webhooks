# webhooks 
Docker image that provides webhooks to e-mail.

# When do you need this?
When you want to host your own solution where by doing a GET request an e-mail is send. I'm using
this to create alerting on my influxdb database. When no new data arrives for a certain period in
a bucket, influxdb will call the URL and I'm receiving an e-mail notification.

This is similar to webhooks-to-email automation that services like Zapier or IFTTT provide. But
now you can host it yourself :-)

# What is in this repo?
It is just a dockerfile that builds an image and publishes it to dockerhub.

# Where do I find the container image?
It is all on dockerhub: [webhooks](https://hub.docker.com/repository/docker/martinh80/webhooks/general)

# Where can I find the documentation?
Have a look at the dockerhub webpage.

# I have a question or problem, how do I contact you?
Please create an issue in this repository.

# Warning! Security considerations
Do NEVER expose this service to the Internet directly. If you do, you are allowing everybody to send
e-mails on your behalf. The connection to the URL is unencrypted and the contents of the message are
in the URL, which means that other can sniff this information without you noticing.
