# STage1 : Build package
FROM maven AS build
WORKDIR /app
COPY . .
RUN mvn clean package

# STage2 : Deploy to Tomcat
FROM tomcat
# Tomcat auto-deploys WARs placed in webapps/, no need to rename to JavaWebApp.war. If renamed, it runs at http://localhost:8080/JavaWebApp/.
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/JavaWebApp.war  

# To auto-deploy and access at http://localhost:8080/ (root path)
# COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080

CMD ["catalina.sh", "run"]