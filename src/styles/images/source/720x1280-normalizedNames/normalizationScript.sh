#!/bin/bash
#
# Copyright (C) 2013 Tomasz Olszak <olszak.tomasz@gmail.com>
# All rights reserved.
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:

# 1. Redistributions of source code must retain the copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
# 3. The name of the author may not be used to endorse or promote products
#    derived from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
# IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
# OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
# IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
# NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
# THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# 

SCRIPT_DIR=$(dirname $0)

cd $SCRIPT_DIR

rm  -rf *.png *.sci default/ black/ white/

cp -r ../720x1280/* .

for file in `find . -name "*#.png"`; do
    normalized=$(echo -n $file | sed s/#\./9\./);
    mv $file $normalized;
done
for file in `find . -name "*&*"`; do
    normalized=$(echo -n $file|sed s/\&/_and_/);
    mv $file $normalized;
done
for file in `find . -name '*.9.png'`; do
    9patch2sci $file;
done

cd ../../720x1280
rm  -rf *.png *.sci default/ black/ white/

cp -r ../sources/720x1280-normalizedNames/* .