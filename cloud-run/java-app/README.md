## download empty spring boot app
```
curl https://start.spring.io/starter.zip \
   -d type=maven-project \
   -d dependencies=web \
   -d javaVersion=21 \
   -d name=helloworld \
   -d artifactId=helloworld \
   -d baseDir=helloworld \
   -o helloworld.zip

```

## UNZIP
```
unzip helloworld.zip
```

## Deploy APP
```
gcloud run deploy --source .

```