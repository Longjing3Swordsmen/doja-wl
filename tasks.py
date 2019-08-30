#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
@version: 2.7.15
@author: vonhng
@contact: vonhng.feng@gmail.com
@time: 2019-08-30 11:49
"""
import os
from datetime import datetime
from invoke import task

root = os.path.dirname(os.path.abspath(__file__))
CURRENTPATH = os.path.dirname(os.path.realpath(__file__))


@task
def build(ctx):
    # 打包
    name = "doja"
    build_dir = os.path.join(root, 'build')
    dist_dir = os.path.join(build_dir, name)
    ctx.run('mkdir -p {dist_dir}'.format(dist_dir=dist_dir), echo=True)

    s = datetime.now().strftime("%Y-%m-%d")
    include_dir = [
        os.path.join(root, 'apps'),
        os.path.join(root, 'conf'),
        os.path.join(root, 'logs'),
        os.path.join(root, 'supervisord'),
        os.path.join(root, 'install.sh'),
        os.path.join(root, 'LICENSE'),
        os.path.join(root, 'README.md'),
    ]
    ctx.run('cp -r {dirs} {dist_dir}'.format(dirs=' '.join(include_dir),
                                             dist_dir=dist_dir), echo=True)
    ctx.run("cd {build_dir} && tar zcvf {name}.{local}.tar.gz {name} && rm -rf {name}".format(
        build_dir=build_dir, name=name, local=s))