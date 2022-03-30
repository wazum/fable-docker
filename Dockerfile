FROM mcr.microsoft.com/dotnet/sdk:5.0-alpine3.15

# Node.js and npm
RUN apk add --update nodejs npm

RUN addgroup -S app && adduser -S app -G app

RUN mkdir -p /app \
    && chown -R app:app /app

RUN apk --no-cache add zsh \
    && echo "PROMPT=\"%n@fable-docker %1~ %# \"" >> /home/app/.zshrc \
    && echo "export PATH=\"$PATH:/home/app/.dotnet/tools\"" >> /home/app/.zshrc \
    && echo "echo \"Running 'dotnet tool restore' in /app … please wait …\"" >> /home/app/.zshrc \
    && echo "cd /app && dotnet tool restore" >> /home/app/.zshrc

USER app
WORKDIR /app

# Expose port for npm dev server
EXPOSE 8080

# Femto package analyzer
RUN dotnet tool install femto --global

CMD ["/bin/zsh"]
