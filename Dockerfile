FROM openjdk:11.0.8-jre-windowsservercore-ltsc2016

SHELL ["powershell"]
ARG BASE_URL
ARG SECRET

RUN (New-Object System.Net.WebClient).DownloadFile('{0}/jnlpJars/slave.jar' -f $env:BASE_URL, 'slave.jar') ;
ENTRYPOINT ["java.exe", "-jar", ".\\slave.jar"]
