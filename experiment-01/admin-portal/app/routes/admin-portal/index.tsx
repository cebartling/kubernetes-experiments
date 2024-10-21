import type { MetaFunction } from "@remix-run/node";

export const meta: MetaFunction = () => {
  return [
    { title: "Admin Portal: Welcome" },
    { name: "description", content: "Welcome to Admin Portal" },
  ];
};

export default function Index() {
  return (
    <div className="font-sans p-4">
      <h1 className="text-3xl">Welcome to the Admin Portal</h1>
    </div>
  );
}
