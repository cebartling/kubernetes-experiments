import type { MetaFunction } from "@remix-run/node";

export const meta: MetaFunction = () => {
  return [
    { title: "Portal: Welcome" },
    { name: "description", content: "Welcome to the Portal!" },
  ];
};

export default function Index() {
  return (
    <div className="font-sans p-4">
      <h1 className="text-3xl">Welcome to the Customer Portal</h1>
    </div>
  );
}
