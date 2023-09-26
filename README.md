Django Web Application Deployment

Docker's automation capabilities have simplified the deployment of our application by packaging it with all dependencies, ensuring consistent environments across different platforms. With Docker, we effortlessly build and deploy our application, streamlining the entire process for efficient and reliable deployment.

This Django web application has been cloned from a public repository, I added a Docker file to make it very easy for user to deploy it. To deploy this web application on AWS or any other cloud platform, please follow these steps:

Build the Docker image by running the following command within the repository directory:
sudo docker build -t your_image_name .

After successfully creating the Docker image, launch the container using the following command:
sudo docker run -d -p 8084:8084 your_image_name

Ensure that you have configured the inbound rules in your security groups to allow traffic on the desired port.

Make certain that Docker is installed on your system before proceeding with the deployment.
By following these steps, you can easily deploy this Django web application on your preferred cloud platform. If you encounter any issues or require further assistance, please feel free to reach out for support.
