FROM postgres:14-alpine
ENV POSTGRES_USER=Master_UDC_2022_G4
ENV POSTGRES_PASSWORD=9PVlYwTLPUsA245d!4
ENV POSTGRES_DB=Master_UDC_2022_G4
COPY dump-2022-MND-1-G4_AsociacionHostelerosACoruna.sql /docker-entrypoint-initdb.d/
EXPOSE 5432