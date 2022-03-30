# Specify the base image
FROM centos:7

# Add a tag
LABEL maintainer="stepanova"

# Update our packages, clean, and install Apache --> create var/www/html
RUN yum -y update && yum clean all && yum install -y httpd

# Copy the app inside the container
COPY index.html /var/www/html

# Port on which the container should listen to:
EXPOSE 80

# Run httpd by doing systemctl start httpd
ENTRYPOINT [ "/usr/sbin/httpd" ]

# Run the container in the background / systemctl enable httpd
CMD [ "-D","FOREGROUND" ]