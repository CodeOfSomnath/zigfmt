const std = @import("std");
const utils = @import("utils.zig");



/// String use all the functions for strings
pub fn String(alloc: std.mem.Allocator) type {
    return struct {
        bytes: []const u8,
        len: usize,
        // max_size: usize,
        allocator: std.mem.Allocator,

        const Self = @This();

        pub fn init(s: []const u8) !String(alloc) {
            return .{
                .bytes = s,
                .len = s.len,
                .allocator = alloc,
            };
        }

        /// This function returns the string representation
        pub fn getStr(self: *Self) []const u8 {
            return self.bytes;
        }


        /// This function returns the character at specified index.
        /// if the index is out of bounds then it will return an error
        pub fn charAt(self: *Self, index: usize) !u8 {
            if (index >= self.len) {
                return error{IndexOutOfBounds};
            } else {
                return self.bytes[index];
            }
        }

        /// Compares two strings lexicographically.
        pub fn compare(self: *Self, another_string: String(alloc)) bool {
            if (self.bytes == another_string.bytes) {
                return true;
            } else {
                return false;
            }
        }

        /// Compares two strings lexicographically, ignoring case differences.
        pub fn compareIgnoreCase(self: *Self, another_string: String(alloc)) !bool {

            var lower_string = try std.heap.page_allocator.alloc(u8, self.len);
            lower_string = std.ascii.lowerString(lower_string, another_string);

            const value = self.compare(another_string);
            std.heap.page_allocator.free(lower_string);
            return value;
        }


        /// Concat of two strings
        pub fn concat(self: *Self, another_str: []const u8) !String(alloc) {
            const bytes = self.bytes;
            const new_bytes = try self.allocator.alloc(u8, bytes.len+another_str.len);
            
            var index = try utils.copy(u8, new_bytes, bytes, 0);
            index = try utils.copy(u8, new_bytes, another_str, index);

            return .{
                .bytes = new_bytes,
                .len = new_bytes.len,
                .allocator = self.allocator
            };
        }

    };
}