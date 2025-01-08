const std = @import("std");
const zigfmt = @import("zigfmt");

pub fn main() !void {
    var result = try zigfmt.string.String(std.heap.page_allocator).init("Hello");
    var new_result = try result.concat("hi");
    std.debug.print("{s}\n", .{new_result.getStr()});
    
}
