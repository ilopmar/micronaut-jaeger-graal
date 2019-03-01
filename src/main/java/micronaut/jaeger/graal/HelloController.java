package micronaut.jaeger.graal;

import io.micronaut.http.annotation.Controller;
import io.micronaut.http.annotation.Get;
import io.micronaut.tracing.annotation.NewSpan;

@Controller("/")
public class HelloController {

    @NewSpan
    @Get("/hello/{name}")
    public String sayHi(String name) {
        return "Hello " + name;
    }

}
