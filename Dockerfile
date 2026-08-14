FROM golang:1.26.2

WORKDIR /app

COPY . .

RUN go mod download

RUN go build -o calculator

EXPOSE 3000

CMD [ "./calculator" ]