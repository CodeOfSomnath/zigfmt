const std = @import("std");


/// copy the value to desired index and return the last index as a size or length
pub fn copy(comptime T: type, dest: []T, source: []const T, starting_index: usize) !usize {
    var i: usize = 0;
    while (i < dest.len) {
        dest[i+starting_index] = source[i];
        i += 1;
        if (i == source.len) {
            break;
        }
    }
    return i;
}