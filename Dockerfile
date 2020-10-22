FROM openjdk:11.0.8-jre-windowsservercore-ltsc2016

SHELL ["powershell"]
ARG BASE_URL=${jenkins-svc-master}
ARG SECRET=${jenkins-master-secrets}

RUN (New-Object System.Net.WebClient).DownloadFile('{0}/jnlpJars/slave.jar' -f $env:BASE_URL, 'slave.jar') ;
ENTRYPOINT ["java.exe", "-jar", ".\\slave.jar"]
