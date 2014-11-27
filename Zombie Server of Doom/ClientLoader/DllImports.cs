using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;

namespace ClientLoader
{
    public static class DllImports
    {
        [DllImport("user32.dll")] public static extern int SetWindowLong(IntPtr hWnd, int nIndex, UInt32 dwNewLong);
        [DllImport("user32.dll", SetLastError = true)] public static extern long SetParent(IntPtr hWndChild, IntPtr hWndNewParent);
        [DllImport("user32.dll", SetLastError = false)] public static extern IntPtr GetDesktopWindow();
        [DllImport("user32.dll", SetLastError = true)] public static extern bool MoveWindow(IntPtr hwnd, int x, int y, int cx, int cy, bool repaint);
        [DllImport("user32.dll")] public static extern IntPtr SetCursor(IntPtr hCursor);
        [DllImport("user32.dll", EntryPoint = "FindWindow", SetLastError = true)] public static extern IntPtr FindWindowByCaption(IntPtr ZeroOnly, string lpWindowName);
        [DllImport("user32")] public static extern bool AnimateWindow(IntPtr hwnd, int time, AnimateWindowFlags flags);
        [DllImport("kernel32.dll", SetLastError = true)] [return: MarshalAsAttribute(UnmanagedType.Bool)] public static extern bool AllocConsole();
    }

    public enum AnimateWindowFlags : uint
    {
        AW_HOR_POSITIVE = 0x00000001,
        AW_HOR_NEGATIVE = 0x00000002,
        AW_VER_POSITIVE = 0x00000004,
        AW_VER_NEGATIVE = 0x00000008,
        AW_CENTER = 0x00000010,
        AW_HIDE = 0x00010000,
        AW_ACTIVATE = 0x00020000,
        AW_SLIDE = 0x00040000,
        AW_BLEND = 0x00080000
    }
}
