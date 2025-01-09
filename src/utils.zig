const std = @import("std");


/// copy the value to desired index and return the last index as a size or length.
/// T - the data type for copy array mostly u8.
/// dest - The destination array for store, it should be initilized before passing to the function
///        dest array size should greater then source to perform a copy otherwise it will return error.
/// source - The source of the array. 
/// starting_index - The dest array starting index to copy the data. 
///                  if starting_index = 10 it will start from 10th index(dest[10]).
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

/// Returns all the index of the 'value'.
/// all primitive types is supported (u8...u64, i8..i64, bool, etc.)
pub fn find(comptime T: type, src: []T, value: T) ![]usize {
    
}