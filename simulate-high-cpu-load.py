import math, time

def simulate_high_cpu_load():

    while True:
        math.factorial(10000)
        time.sleep(0.5)

if __name__ == "__main__":
    simulate_high_cpu_load()
