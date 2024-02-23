import styles from './Button.module.css'

type ButtonProps = React.DetailedHTMLProps<
    React.ButtonHTMLAttributes<HTMLButtonElement>,
    HTMLButtonElement
>

export function Button({ children, ...rest }: ButtonProps) {
    return (
        <button className={styles.container} {...rest}>
            {children}
        </button>
    )
}