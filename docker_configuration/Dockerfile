# I will be building a custom docker image
# that is made out of the built-in
# 'hello-world' image, as well as an
#  Apache web server.

FROM hello-world
CMD [ "docker container run hello-world " ]

FROM httpd:latest
RUN mkdir -p ~/TEST_DIRECTORY
CMD [ "echo 'The custom image has been created" ]