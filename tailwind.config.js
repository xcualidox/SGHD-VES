/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./*.php'],
  theme: {
    extend: {
      keyframes: {
        entrance: {
          '0%':{
            opacity: '0',
            transform: 'translateY(-50px)'
          },
          '100%':{
            opacity: '1',
            transform: 'translateY(0)'
          }

        },
        exit: {
          '0%':{
            opacity: '1',
            transform: 'translateY(0)'
          },
          '100%':{
            opacity: '0',
            transform: 'translateY(-50px)'
          }

        },
        entranceCenter: {
          '0%': {
            opacity: '0'
          },
          '100%': {
            opacity: '1'
          }
        }
      },
      animation: {
        entrance: 'entrance 1s ease 0s 1 normal forwards',
        exit: 'exit 1s ease 0s 1 normal forwards',
        entranceCenter: 'entranceCenter 1s ease 0s 1 normal forwards'
      }
    },
  },
  plugins: [],
}

