'use client';

export default function Button({children, action}: { children: string, action: () => void }) {
    return (
        <button
            onClick={action}
            className="px-4 py-2 bg-blue-500 text-white rounded-md">
            {children}
        </button>
    );
}