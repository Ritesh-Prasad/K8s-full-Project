FROM nginx:alpine


COPY website/index.html /usr/share/nginx/html/
COPY website/style.css /usr/share/nginx/html/
COPY website/script.js /usr/share/nginx/html/
COPY website/profile.jpg /usr/share/nginx/html/
COPY website/Ritesh_Prasad_Cloud_DevOps_Engineer_Resume.pdf /usr/share/nginx/html/
# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]