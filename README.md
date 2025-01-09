# zigfmt

This is string formatting library in zig. it is used to format strings and standard output operations and standard input operations. This is a simple easy to use library made using zig version 0.13.0 and it used build.zig.zon file as build script.

### How to install it ??

We will use the standard zig build tool to add this project into library

#### Steps:
1.  Add the url of the library (ex. https://example.com/package.tar.gz)

```bash
zig fetch --save "https://github.com/ZigVerse/zigfmt/archive/refs/heads/main.tar.gz"
```

2. Add the module in the your <b>build.zig</b> file

```zig
const zigfmt = b.dependency("zigfmt", .{
    .target = target,
    .optimize = optimize
});

const exe = b.addExecutable(.{
    .name = "example_project",
    .root_source_file = b.path("src/main.zig"),
    .target = target,
    .optimize = optimize,
});

exe.root_module.addImport("zigfmt", zigfmt.module("zigfmt"));
```

In this example the <b>exe</b> variable will be automatically created by <b>zig init</b> command, so you need to configure it properly.

