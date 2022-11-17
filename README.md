# nlg_cli

Simple CLI app with various utilites, made for my own use

### Template syntax
```
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
```

### Roadmap

Basicly, by making a NLG CLI i'm trying to make the full blown developer tool.
Templates for various project are the most basic things, cause by making those
i'm trying to also learn Dart :). Currently, the only feature that i also want
to include in this project is possibility to install various SDK's and tools (such as node.js or dart sdk)
    