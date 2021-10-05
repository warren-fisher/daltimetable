import { createContext, useContext, useState } from 'react';

const UserContext = createContext();

export function UserWrapper({ children }) {

    const [theme, setTheme] = useState('light');

    return (
        <UserContext.Provider value={{theme, setTheme}}>
            {children}
        </UserContext.Provider>
    );
}

export const useUser = () => useContext(UserContext);