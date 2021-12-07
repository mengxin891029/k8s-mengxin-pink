FROM nginx:1

# RUN unlink /etc/nginx/sites-enabled/default

RUN rm /etc/nginx/conf.d/default.conf

COPY static /data/static

COPY templates /data/www

COPY mengxin-pink.conf /etc/nginx/conf.d

# RUN ln -s /etc/nginx/sites-available/mengxin-ml.conf /etc/nginx/sites-enabled/mengxin-ml.conf