FROM golang:bullseye as builder

WORKDIR /app

COPY . .

RUN go build main.go

ENTRYPOINT ["./main"] 

FROM scratch as prod
COPY --from=builder /app /
CMD ["/main"]