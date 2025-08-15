const std = @import("std");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    const args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, args);

    if (args.len < 2) {
        std.debug.print("dog: missing file operand\n", .{});
        std.debug.print("Try 'dog --help' for more information.\n", .{});
        std.process.exit(1);
    }

    if (std.mem.eql(u8, args[1], "--help")) {
        std.debug.print("Usage: dog [FILE]...\n", .{});
        std.debug.print("Delete FILE(s) after displaying their contents.\n", .{});
        std.debug.print("Like cat, but removes files after reading them.\n", .{});
        return;
    }

    for (args[1..]) |filename| {
        deleteFile(filename) catch |err| {
            std.debug.print("dog: {s}: {}\n", .{ filename, err });
            std.process.exit(1);
        };
    }
}

fn deleteFile(filename: []const u8) !void {
    const file = std.fs.cwd().openFile(filename, .{}) catch |err| {
        return err;
    };
    defer file.close();

    const contents = try file.readToEndAlloc(std.heap.page_allocator, 1024 * 1024 * 100); // 100MB max
    defer std.heap.page_allocator.free(contents);

    try std.io.getStdOut().writeAll(contents);

    try std.fs.cwd().deleteFile(filename);
}
