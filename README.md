# nlg_cli

Simple CLI app with various utilites, made for my own use

### Template syntax

{
    name: String
    desc: String?
    base: String?
    files: {
        create: [
            {
                name: "file.txt",
                content: "Hello World"
            }
        ],
        override: [
            {
                name: "src/main.js",
                content: "console.log(':)')"
            }
        ],
        delete: [
            "image.png",
            "README.md"
        ]
    },
    dirs: {
        create: [],
        override: [],
        delete: [],
    },
    init: {
        name: "npm",
        args: [ "init" ]
    },
    finish: {
        name: "npm",
        args: [ "install" ]
    }
}