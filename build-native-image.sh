./gradlew assemble
java -cp build/libs/micronaut-jaeger-graal-0.1-all.jar io.micronaut.graal.reflect.GraalClassLoadingAnalyzer 
native-image --no-server \
             --class-path build/libs/micronaut-jaeger-graal-0.1-all.jar \
			 -H:ReflectionConfigurationFiles=build/reflect.json \
			 -H:EnableURLProtocols=http \
			 -H:IncludeResources="logback.xml|application.yml|META-INF/services/*.*" \
			 -H:Name=micronaut-jaeger-graal \
			 -H:Class=micronaut.jaeger.graal.Application \
			 -H:+ReportUnsupportedElementsAtRuntime \
			 -H:+AllowVMInspection \
			 --rerun-class-initialization-at-runtime='sun.security.jca.JCAUtil$CachedSecureRandomHolder,javax.net.ssl.SSLContext' \
			 --delay-class-initialization-to-runtime=io.netty.handler.codec.http.HttpObjectEncoder,io.netty.handler.codec.http.websocketx.WebSocket00FrameEncoder,io.netty.handler.ssl.util.ThreadLocalInsecureRandom