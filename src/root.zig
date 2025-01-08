const std = @import("std");
const testing = std.testing;

// modules
pub const string = @import("string.zig");
pub const utils = @import("utils.zig");

test "creating a string" {
    _ = string.String(std.heap.page_allocator).init("Hello") catch testing.expect(false);
}

test "concat strings" {
    var str = try string.String(std.heap.page_allocator).init("h");
    const newstr = try str.concat("v");
    try testing.expect(std.mem.eql(u8, newstr.bytes, "hv"));
}
