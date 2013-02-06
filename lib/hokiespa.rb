require 'msgpack'
module HokieSpa
  class NetworkError < StandardError; end

  def self.root
    File.expand_path '../..', __FILE__
  end

  def self.runp(s)
    prelude = <<-PYTHON
from hokiespa import hokiespa
import sys
import msgpack
    PYTHON
    v = `cd #{root}; python -c "#{prelude << s}"`
    raise NetworkError if $?.exitstatus != 0
    MessagePack.unpack v
  end

  class HokieSpa
    def initialize
    end

    def get_subjects
      ::HokieSpa.runp <<-PYTHON
k = msgpack.packb(hokiespa.getSubjects())
sys.stdout.write(k)
      PYTHON
    end

    def get_courses(subject_code, year, term, only_open = false)
      ::HokieSpa.runp <<-PYTHON
k = hokiespa.getCourses('#{subject_code}', '#{year}', '#{term}', #{only_open ? 'True':'False'})
f = list()
for c in k:
  h = c.__dict__
  h['meeting_times'] = [m.__dict__ for m in c.meeting_times]
  f.insert(0, h)
sys.stdout.write(msgpack.packb(f))
      PYTHON
    end

    def get_course_ids(subject_code, year, term, only_open = false)
      ::HokieSpa.runp <<-PYTHON
k = hokiespa.getCourseIds('#{subject_code}', '#{year}', '#{term}', #{only_open ? 'True':'False'})
sys.stdout.write(msgpack.packb(list(k)))
      PYTHON
    end

    def get_course_ids_and_crses(subject_code, year, term, only_open = false)
      ::HokieSpa.runp <<-PYTHON
k = hokiespa.getCourseIdsAndCRSEs('#{subject_code}', '#{year}', '#{term}', #{only_open ? 'True':'False'})
sys.stdout.write(msgpack.packb(list(k)))
      PYTHON
    end
  end
end
