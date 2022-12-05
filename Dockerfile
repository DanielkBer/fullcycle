FROM golang:1.17 as builder

WORKDIR /hellofc

COPY . .

RUN go build -o hello

EXPOSE 8080

FROM scratch

COPY --from=builder /hellofc .

CMD ["./hello"]