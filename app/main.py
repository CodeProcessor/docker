import datetime
from typing import Optional

from fastapi import FastAPI
from pydantic import BaseModel


class Greeting(BaseModel):
    first_name: str
    last_name: Optional[str] = ""
    timeshift: int = 5.5


app = FastAPI()


@app.get("/")
def read_root() -> dict:
    return {
        "Hello": "Docker!"
    }


@app.post("/greet_me/")
async def create_item(data: Greeting) -> dict:
    # get the morning, afternoon, evening greeting using time
    _current_hour = datetime.datetime.utcnow().hour + data.timeshift
    if _current_hour < 12:
        part_of_day = "Morning"
    elif 12 >= _current_hour < 17:
        part_of_day = "Afternoon"
    else:
        part_of_day = "Evening"

    return {
        "Greeting": f"Hello Good {part_of_day} {data.first_name} {data.last_name}! Have a nice day! :) "
    }


if __name__ == '__main__':
    import uvicorn

    uvicorn.run(app, host="0.0.0.0", port=8000)
