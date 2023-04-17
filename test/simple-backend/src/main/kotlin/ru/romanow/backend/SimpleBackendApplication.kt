package ru.romanow.backend

import org.slf4j.LoggerFactory
import org.springframework.boot.ApplicationArguments
import org.springframework.boot.ApplicationRunner
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class SimpleBackendApplication : ApplicationRunner {
    private val logger = LoggerFactory.getLogger(SimpleBackendApplication::class.java)

    override fun run(args: ApplicationArguments) {
        logger.info(
            "Task Service: Memory: {}, Total: {}, Free: {}",
            toMb(Runtime.getRuntime().totalMemory()),
            toMb(Runtime.getRuntime().maxMemory()),
            toMb(Runtime.getRuntime().freeMemory())
        )
    }

    private fun toMb(memory: Long) = String.format("%.2fMb", memory / (1024.0 * 1024.0))
}

fun main(args: Array<String>) {
    runApplication<SimpleBackendApplication>(* args)
}
