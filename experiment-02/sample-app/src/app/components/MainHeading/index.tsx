export default function MainHeading({children}: {children: string}) {

    return (
        <h1 className="font-extrabold text-3xl">{children}</h1>
    );
}