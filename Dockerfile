FROM nginx:alpine


COPY index.html /usr/share/nginx/html/
COPY style.css /usr/share/nginx/html/
COPY script.js /usr/share/nginx/html/
COPY profile.jpg /usr/share/nginx/html/
COPY Ritesh_Prasad_Cloud_DevOps_Engineer_Resume.pdf /usr/share/nginx/html/
# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]